# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_role=Role.create(nombre: "Administrador")
Role.create(nombre: "Gerente")
Role.create(nombre: "Empleado")

admin = User.create(
  alias: "admin_user",
  email: "admin@example.com",
  phone: "123456789",
  password: "admin",
  role: admin_role
)
