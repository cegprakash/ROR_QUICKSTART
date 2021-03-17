class UsersController < ApplicationController

    def index

        name = 'User ' + rand(1..10000).to_s

        User.create({:name => name})

        render 'users/index'

    end

    def list

        @users = User.all

        render 'users/list'

    end

end