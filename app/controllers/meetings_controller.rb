class MeetingsController < AuthenticateController
  before_action :authorize_user
  before_action :set_profile, only: %i[new create]

  def new
    @meeting = @project.meetings.new
  end

  def create
    @meeting = @project.meetings.new meeting_params

    if @meeting.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @project = Project.find(params[:project_id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :description, :meeting_link)
  end

  def authorize_user
    redirect_to root_path, notice: 'You can not perform this action.' if current_user.profile.member?
  end
end
