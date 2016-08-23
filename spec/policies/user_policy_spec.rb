require 'rails_helper'
require "pundit/rspec"
describe UserPolicy do
  let (:user) { FactoryGirl.build_stubbed :user }
  let (:other) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }
  let (:mod) { FactoryGirl.build_stubbed :user, :mod }
  let (:writer) { FactoryGirl.build_stubbed :user, :writer }

  subject { described_class }

  permissions :index? do
    context 'admin' do
     it { should permit(admin,user)}
    end
    context 'user' do
      it { should permit(user,other)}
    end
  end

  # permissions :show? do
  #   # context 'admin' do 
  #   #   it {should permit(admin,user)} 
  #   # end
  # end

  permissions :update?,:edit? do
    context 'self' do
      it 'users' do 
        should permit(user, user)
      end
      it 'mods' do 
        should permit(mod, mod)
      end
       it 'writers' do 
        should permit(writer, writer)
      end
       it 'admins' do 
        should permit(admin,admin)
      end
    end
    context 'others' do
      it 'users' do 
        should_not permit(user, other)
      end
      it 'mods' do 
        should_not permit(mod, other)
      end
       it 'writers' do 
        should_not permit(writer, other)
      end
       it 'admins' do 
        should permit(admin,other)
      end
       it 'visiter' do 
        should_not permit(nil,other)
      end
    end
  end

  permissions :destroy? do
    it 'admin' do
      should permit(admin,other)
    end
    it 'others' do
      should_not permit(writer,other)
      should_not permit(mod,other)
      should_not permit(nil,other)
      should_not permit(user,other)
    end
  end

end
