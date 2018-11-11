Role.create!([
  {name: "Súper Admin", keyword: "superadmin", description: "Administra la aplicación, así como a los demás administradores."},
  {name: "Administrador", keyword: "admin", description: "Administra Empresas, usuarios de las mismas y les asigna un CM"},
  {name: "Community Manager", keyword: "cm", description: "Crea y gestiona campañas, asigna usuarios registrados en la Empresa a las campañas. Generaredes semánticas y publicaciones para las mismas. Publica en Facebook o programa las publicaciones."},
  {name: "Generador de contenido", keyword: "cg", description: "Crea contenido (text y multimedia si así lo desea) para las publicaciones."},
  {name: "Diseñador", keyword: "designer", description: "Genera contenido multimedia para las publicaciones."},
  {name: "Cliente", keyword: "client", description: "Puede ver resultados de las campañas."}
])
Company.create!([
  {name: "Coca-Cola", description: "Coca-Cola, or Coke, is a carbonated soft drink produced by The Coca-Cola Company. Originally intended as a patent medicine, it was invented in the late 19th century by John Pemberton and was bought out by businessman Asa Griggs Candler, whose marketing tactics led Coca-Cola to its dominance of the world soft-drink market throughout the 20th century.", contact_name: "Jaime García", phone: "3216549870", email: "info@coca-cola.com", address: "Some direction", init_hour: "2000-01-01 08:00:00", final_hour: "2000-01-01 21:00:00", deleted: false},
  {name: "La Marina", description: "Expertos en brindar servicio cálido y productos novedosos en Ropa, Zapatos, Línea Blanca, Electrónica, Laptops, Celulares, Cómputo, Muebles, Motocicletas y más.", contact_name: "Sebastián Jimenez", phone: "3216549870", email: "info@lamarina.com", address: "Some direction", init_hour: "2000-01-01 08:00:00", final_hour: "2000-01-01 21:00:00", deleted: false},
  {name: "Kiosko", description: "Coca-Cola, or Coke, is a carbonated soft drink produced by The Coca-Cola Company. Originally intended as a patent medicine, it was invented in the late 19th century by John Pemberton and was bought out by businessman Asa Griggs Candler, whose marketing tactics led Coca-Cola to its dominance of the world soft-drink market throughout the 20th century.", contact_name: "Antonio Martinez", phone: "3216549870", email: "info@mi-kisko.com", address: "Some direction", init_hour: "2000-01-01 00:00:00", final_hour: "2000-01-01 23:59:59", deleted: false},
  {name: "El Bodegón", description: "aslkdn laksn dlkasndlkasndlasndlkaklsdnlaskndlas dkln", contact_name: "Eliminar a", phone: "3216549870", email: "rikrc.d@gmail.com", address: ".", init_hour: "2000-01-01 09:00:00", final_hour: "2000-01-01 18:00:00", deleted: false}
])
User.create!([
  {role_id: 1, company_id: nil, works_on_id: nil, username: "admin", name: "Administrator", lastname: nil, image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "admin@admin.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2018-11-06 06:41:00", last_sign_in_at: "2018-11-05 21:02:42", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 2, company_id: 3, works_on_id: nil, username: "jvalencia", name: "Joel", lastname: "Valencia", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "jvalencia@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2018-11-06 05:54:31", last_sign_in_at: "2018-11-06 01:36:26", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 3, company_id: nil, works_on_id: 3, username: "rvillagrana", name: "Ricardo", lastname: "Villagrana", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "ricardo@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2018-11-05 23:09:16", last_sign_in_at: "2018-11-05 22:58:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 4, company_id: nil, works_on_id: 3, username: "blarios", name: "Brando", lastname: "Larios", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "blarios@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {role_id: 5, company_id: nil, works_on_id: 3, username: "westrada", name: "Williams", lastname: "Estrada", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "westrada@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-11-06 06:39:44", last_sign_in_at: "2018-11-06 06:39:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 4, company_id: nil, works_on_id: 3, username: "pvillicana", name: "Paul", lastname: "Villicaña", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "admin@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {role_id: 2, company_id: 2, works_on_id: nil, username: "rmoreno", name: "Ricardo", lastname: "Moreno", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "rmoreno@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-11-05 17:12:58", last_sign_in_at: "2018-11-05 17:11:41", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 2, company_id: 4, works_on_id: nil, username: "eliminar", name: "eliminar", lastname: "pronto", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "eliminar@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-11-06 06:51:37", last_sign_in_at: "2018-11-06 06:51:37", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 3, company_id: nil, works_on_id: 4, username: "amoreno", name: "Antonio", lastname: "Moreno", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "amoreno@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-11-07 05:05:52", last_sign_in_at: "2018-11-06 07:07:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 4, company_id: nil, works_on_id: 4, username: "irincon", name: "Israel", lastname: "Rincón", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "irincon@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-11-06 07:32:54", last_sign_in_at: "2018-11-06 07:32:54", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {role_id: 5, company_id: nil, works_on_id: 4, username: "lozuna", name: "Luis", lastname: "Ozuna", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "lozuna@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {role_id: 5, company_id: nil, works_on_id: 4, username: "dpinto", name: "Diana", lastname: "Pinto", image: nil, born_date: nil, deleted: false, facebook_access_token: nil, email: "dpinto@app.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil}
])
Campaign.create!([
  {company_id: 3, community_manager_id: 3, name: "Promociones Noviembre", objetive: "Objetivo de la campaña es lograr hacer que la gente de más likes a la página y vender más.", init_date: "2018-12-31", finish_date: "2019-12-31", image: nil, finished: false, deleted: false},
  {company_id: 3, community_manager_id: 3, name: "Campaña 4", objetive: "Objetivo de la campaña es lograr hacer que la gente de más likes a la página y vender más.", init_date: "2018-12-31", finish_date: "2019-12-31", image: nil, finished: false, deleted: false},
  {company_id: 4, community_manager_id: 9, name: "Promoción en motocicletas", objetive: "Vender más motocicletas en Colima", init_date: "2018-11-26", finish_date: "2018-12-23", image: "", finished: nil, deleted: false}
])
Node.create!([
  {node_id: nil, campaign_id: 1, name: "Red Semántica"},
  {node_id: nil, campaign_id: 2, name: "Red Semántica"},
  {node_id: nil, campaign_id: 3, name: "Red semántica"},
])
PublicationStatus.create!([
  {name: "Iniciada", description: "La publicación está recién creada"},
  {name: "En proceso", description: "La publicación está siendo editada"},
  {name: "Pendiente de aprobación", description: "En espera de aprobación del Community Manager"},
  {name: "Lista para publicarse", description: "La publicación ya está aprobada por el Community Manager"},
  {name: "Publicada", description: "La publicación ya está en Facebook"},
  {name: "Eliminada", description: "La publicación se eliminó"}
])
# Publication.create!([])
