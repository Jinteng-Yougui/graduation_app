require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'scopeのテスト' do
    let!(:booking){FactoryBot.create(:booking, title: 'Hello', category: 'その他')}
    let!(:second_booking){FactoryBot.create(:second_booking, title: 'task2', priority: '未着手')}
    context 'タスクのタイトルを検索欄に入力' do
      it '検索ができる' do
        expect(Task.search_by_title('task1').count).to eq 1
      end
    end
    context 'タスクのステータスを検索欄で選択' do
      it '検索ができる' do
        expect(Task.search_by_priority('未着手').count).to eq 2
      end
    end
    context 'タスクのタイトルとステータスを検索欄に入力' do
      it '検索ができる' do
        expect(Task.search_by_title('task1').search_by_priority('未着手').count).to eq 1
      end
    end
  end
end
