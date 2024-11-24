require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # Inicia sesión con el usuario existente
    post session_path, params: { user: { email: @user.email, password: "password" } }
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    # Usamos un password y password_confirmation para crear el usuario
    assert_difference("User.count") do
      post users_url, params: { user: {
        email: "new_user@example.com",
        entryDate: "2024-11-23",
        alias: "newuser",
        password: "password",
        password_confirmation: "password",
        phone: "123456789",
        role_id: 1
      } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    # No deberíamos enviar password_digest en los parámetros
    patch user_url(@user), params: { user: {
      email: @user.email,
      entryDate: @user.entryDate,
      alias: @user.alias,
      password: "newpassword",
      password_confirmation: "newpassword",
      phone: @user.phone,
      role_id: @user.role_id
    } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
