class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_not_found
    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    # rescue ActiveRecord::RecordInvalid => invalid
    #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def record_not_found(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
