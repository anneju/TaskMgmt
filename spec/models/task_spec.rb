require 'rails_helper'

RSpec.describe Task, type: :model do

  describe "title, description, start_time, end_time must be filled in" do
    context "valid task" do
      it "task with title, description, start_time, end_time" do
        task = build(:task)
        expect(task).to be_valid
      end
    end

    context "invalid task" do
      it "title cannot be null" do
        task = build(:task, title: nil)
        expect(task).not_to be_valid
      end

      it "description cannot be null" do
        task = build(:task, description: nil)
        expect(task).not_to be_valid
      end

      it "start_time cannot be null" do
        task = build(:task, start_time: nil)
        expect(task).not_to be_valid
      end

      it "end_time cannot be null" do
        task = build(:task, end_time: nil)
        expect(task).not_to be_valid
      end
    end
  end

  describe "end_time must be on_or_after now" do
    context "valid end_time" do
      it "end_time to be tmr" do
        task = build(:task)
        expect(task).to be_valid
      end
    end

    context "invalid end_time" do
      it "end_time to be yesterday" do
        task = build(:task, start_time: (DateTime.now - 2), end_time: (DateTime.now - 1))
        expect(task).not_to be_valid
      end
    end
  end

  describe "end_time must be on_or_after start_time" do
    context "valid end_time" do
      it "end_time is later than start_time" do
        task = build(:task)
        expect(task).to be_valid
      end
    end

    context "invalid end_time" do
      it "end_time is earlier than start_time" do
        task = build(:task, start_time: (DateTime.now), end_time: (DateTime.now - 1))
        expect(task).not_to be_valid
      end
    end
  end
end
