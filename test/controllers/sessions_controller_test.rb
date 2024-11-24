require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # Test para la acción new
  test "should get new" do
    get new_session_path  # Ruta para el formulario de inicio de sesión
    assert_response :success
  end

  test "should create session" do
    # Crea un usuario con una contraseña cifrada
    admin_role=Role.create(nombre: "Administrador")
    user = User.create!(email: "new_user@example.com",
    entryDate: "2024-11-23",
    alias: "newuser",
    password: "password",
    password_confirmation: "password",
    phone: "123456789",
    role: admin_role)

    # Intenta autenticar al usuario
    post session_path, params: { user: { email: user.email, password: "password" } }

    # Asegúrate de que la sesión redirige al usuario correctamente después de iniciar sesión
    assert_redirected_to root_path
  end

  test "should destroy session" do
    user = users(:one)  # Asegúrate de tener un usuario en los fixtures o crea uno
    post session_path, params: { user: { email: user.email, password: "password" } }  # Autenticación

    # Ahora puedes hacer la solicitud para destruir la sesión
    delete session_path
    assert_redirected_to root_path  # Asegúrate de que redirija a la raíz
  end
end
