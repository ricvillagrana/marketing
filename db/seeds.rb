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

<<<<<<< Updated upstream
admin = User.new(
  email: 'admin@admin.com', 
  password: '123456',
  name: 'Administrator',
  username: 'admin'
=======
PublicationStatus.create(
  [
    {
      name: 'Iniciada',
      description: 'La publicación está recién creada'
    },
    {
      name: 'En proceso',
      description: 'La publicación está siendo editada'
    },
    {
      name: 'Pendiente de aprobación',
      description: 'En espera de aprobación del Community Manager'
    },
    {
      name: 'Lista para publicarse',
      description: 'La publicación ya está aprobada por el Community Manager'
    },
    {
      name: 'Publicada',
      description: 'La publicación ya está en Facebook'
    },
    {
      name: 'Eliminada',
      description: 'La publicación se eliminó'
    },
  ]
)

User.create(
  [
    {
      email: 'admin@admin.com',
      password: '123456',
      name: 'Administrator',
      username: 'admin',
      # roles: [Role.where(keyword: 'superadmin').first]
    },
    {
      email: 'jvalencia@app.com', 
      password: '123456',
      name: 'Joel',
      lastname: 'Valencia',
      username: 'jvalencia',
      # roles: [Role.where(keyword: 'admin').first]
    },
    {
      email: 'ricardo@app.com', 
      password: '123456',
      name: 'Ricardo',
      lastname: 'Villagrana',
      username: 'rvillagrana',
      # roles: [Role.where(keyword: 'cm').first]
    },
    {
      email: 'blarios@app.com', 
      password: '123456',
      name: 'Brando',
      lastname: 'Larios',
      username: 'blarios',
      # roles: [Role.where(keyword: 'cg').first]
    },
    {
      email: 'westrada@app.com', 
      password: '123456',
      name: 'Williams',
      lastname: 'Estrada',
      username: 'westrada',
      # roles: [Role.where(keyword: 'designer').first]
    },
    {
      email: 'admin@app.com', 
      password: '123456',
      name: 'Paul',
      lastname: 'Jaime',
      username: 'pjaime',
      # roles: [Role.where(keyword: 'gc').first]
    },
  ]
)

Company.create(
  [
    {
      name: 'Coca-Cola',
      description: 'Coca-Cola, or Coke, is a carbonated soft drink produced by The Coca-Cola Company. Originally intended as a patent medicine, it was invented in the late 19th century by John Pemberton and was bought out by businessman Asa Griggs Candler, whose marketing tactics led Coca-Cola to its dominance of the world soft-drink market throughout the 20th century.',
      contact_name: 'Jaime García',
      phone: '3216549870',
      email: 'info@coca-cola.com',
      address: 'Some direction',
      init_hour: '08:00:00',
      final_hour: '21:00:00'
    },
    {
      name: 'La Marina',
      description: 'Expertos en brindar servicio cálido y productos novedosos en Ropa, Zapatos, Línea Blanca, Electrónica, Laptops, Celulares, Cómputo, Muebles, Motocicletas y más.',
      contact_name: 'Sebastián Jimenez',
      phone: '3216549870',
      email: 'info@lamarina.com',
      address: 'Some direction',
      init_hour: '08:00:00',
      final_hour: '21:00:00'
    },
    {
      name: 'Kiosko',
      description: 'Coca-Cola, or Coke, is a carbonated soft drink produced by The Coca-Cola Company. Originally intended as a patent medicine, it was invented in the late 19th century by John Pemberton and was bought out by businessman Asa Griggs Candler, whose marketing tactics led Coca-Cola to its dominance of the world soft-drink market throughout the 20th century.',
      contact_name: 'Antonio Martinez',
      phone: '3216549870',
      email: 'info@mi-kisko.com',
      address: 'Some direction',
      init_hour: '00:00:00',
      final_hour: '23:59:59'
    },
  ]
)

kiosko = Company.find(3)
kiosko.users.append(User.where(username: 'rvillagrana').first)
kiosko.users.append(User.where(username: 'blarios').first)
kiosko.users.append(User.where(username: 'westrada').first)
kiosko.users.append(User.where(username: 'pjaime').first)
kiosko.admin = User.find(2)

7.times do |n|
  campaign = kiosko.campaigns.new(
    community_manager_id: 3,
    name: "Campaña #{n}",
    semantic_network: Node.new(name: 'Red Semántica'),
    objetive: 'Objetivo de la campaña es lograr hacer que la gente de más likes a la página y vender más.',
    init_date: '2018-12-31',
    finish_date: '2019-12-31'
>>>>>>> Stashed changes
  )
admin.roles.append(Role.first)
admin.save
