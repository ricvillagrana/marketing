# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([
  {
    name: 'Súper Admin', 
    description: 'Administra la aplicación, así como a los demás administradores.',
    keyword: 'superadmin'
  },
  {
    name: 'Administrador', 
    description: 'Administra Empresas, usuarios de las mismas y les asigna un CM',
    keyword: 'admin'
  },
  {
    name: 'Community Manager', 
    description: 'Crea y gestiona campañas, asigna usuarios registrados en la Empresa a las campañas. Generaredes semánticas y publicaciones para las mismas. Publica en Facebook o programa las publicaciones.',
    keyword: 'cm'
  },
  {
    name: 'Generador de contenido', 
    description: 'Crea contenido (text y multimedia si así lo desea) para las publicaciones.',
    keyword: 'cg'
  },
  {
    name: 'Diseñador', 
    description: 'Genera contenido multimedia para las publicaciones.',
    keyword: 'designer'
  },
  {
    name: 'Cliente',
    description: 'Puede ver resultados de las campañas.',
    keyword: 'client'
  }
  ])

admin = User.new(
  email: 'admin@admin.com', 
  password: '123456',
  name: 'Administrator',
  username: 'admin'
  )
admin.roles.append(Role.first)
admin.save
