class InstructorsController < ApplicationController
    # create, read, update, delete instructors 

    def index 
        instructors = Instructor.all 
        render json: instructors, status: :ok 
    end

    def show 
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor, status: :ok
    end

    def create 
        instructor = Instructor.create(name: params[:name])
        render json: instructor, status: :created
    end
    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update(name: params[:name])
        render json: instructor, status: :accepted
    end
    def destroy 
        instructor = Instructor.find_by(id: params[:id]) 

        instructor.destroy

        head :no_content
    end
end
