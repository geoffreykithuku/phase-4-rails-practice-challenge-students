class StudentsController < ApplicationController
# rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
    # read all students 

    def index 
        student = Student.all 
        render json: student, status: :ok 
    end 

    # show one student using id 

    def show 

        st = Student.find_by(id: params[:id])
        if st
         render json: st, status: :ok 
        else
            render json: {error: "Not found"}, status: :not_found 
        end
    end 

    # delete 
    def destroy  
        st = Student.find_by(id: params[:id])
        if st 
            st.destroy
             head :no_content
        else
            render json: {error:"No such student"}, status: :not_found
        end
    end  

    # create 
    def create 
        st = Student.create(
            name: params[:name], 
            major: params[:major],
            age: params[:age],
            instructor_id: params[:instructor_id]
        )
        if st.valid?
             render json: st, status: :created 
        else 
             render json: {error: "Age must be greater than 18"}, status: :not_found 
        end

    end 



    # update 
    def update 
         st = Student.find_by(id: params[:id])
         st.update!(
            
            age: params[:age]
         ) 
         if st.valid?
          render json: st, status: :accepted
         else
            render json: {error: "Invalid age"}
         end
    end



    # private 
    #  def unprocessable_entity_method 
    #         render json: {errors: "Invalid age"}, status: :unprocessable_entity
    #     end
end
