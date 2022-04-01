class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
    @fun = 'Error'
    case @test.questions.sum
    when 18..20
      @fun = 'Buen funcionamiento familiar'
    when 14..17
      @fun = 'Disfuncion familiar leve'
    when 10..13
      @fun = 'Disfuncion familiar moderada'
    when 0..9
      @fun = 'Disfuncion familiar severa'
    end
  end

  # GET /tests/new
  def new
    @user = User.find_by_id(params[:user_id])
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit; end

  # POST /tests or /tests.json
  def create
    @test = Test.new(patient_age: test_params[:patient_age],
                     patient_sex: test_params[:patient_sex],
                     patient_name: test_params[:patient_name],
                     questions: [test_params[:question_1].to_i, test_params[:question_2].to_i, test_params[:question_3].to_i,
                                 test_params[:question_4].to_i, test_params[:question_5].to_i])
    @user = User.find_by_id(params[:user_id])
    @user.tests << @test

    respond_to do |format|
      if @test.save
        format.html { redirect_to user_test_url(id: @test.id), notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_params
    params.require(:test).permit(:patient_name, :patient_sex, :patient_age, :questions,
                                 :question_1,
                                 :question_2,
                                 :question_3,
                                 :question_4,
                                 :question_5,
                                 :user_id)
  end
end
