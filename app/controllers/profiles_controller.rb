class ProfilesController < AuthenticateController
  before_action :set_user
  skip_before_action :user_has_profile, only: %i[new create]
  before_action :set_profile, only: %i[show edit update destroy]

  def edit; end

  def new
    if current_user.profile.present?
      redirect_to root_path
    else
      @profile = @user.build_profile
    end
  end

  def create
    @profile = @user.build_profile profile_params

    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_path notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update profile_params
        format.html { redirect_to user_path(@user.token_id), notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_user
    @user = User.find_by(token_id: params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :birth, :phone, :country, :avatar)
  end
end
