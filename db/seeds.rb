
puts "Se limpia la BD"
User.destroy_all
Dolar.destroy_all
Post.destroy_all

puts "Se crean los usuarios"
User.create!(
	nombre: 'Rafael',
	apellido: 'Rodriguez',
	username: 'rafa',
	email: 'rafa@com',
	password: '123456')

User.create!(
	nombre: 'Julio',
	apellido: 'Peña',
	username: 'julio',
	email: 'juliopodemos@gmail.com',
	password: '123456')

puts "Se carga el dolar"
Dolar.create!(cambio: 198545075)

puts "Se cargan los productos demo"
Post.create!(
	{
		title: "Elíptica",
		body: "La mejor en su clase",
		image: File.open('app/assets/images/seed/eliptica.png'),
		existencia: 3,
		precio: 17500,
		publicado: true
	}
)

Post.create!(
	{
		title: "Teclado",
		body: "Teclado para gamer, EN OFERTA!!!",
		image: File.open('app/assets/images/seed/teclado.png'),
		existencia: 2,
		precio: 7999,
		publicado: true
	}
)

Post.create!(
	{
		title: "Iphone XXX",
		body: "Nueno de paquete, APROVECHE!!!",
		image: File.open('app/assets/images/seed/iphone.png'),
		existencia: 1,
		precio: 48999,
		publicado: true
	}
)

Post.create!(
	{
		title: "Perfume",
		body: "Recien llegado al país",
		image: File.open('app/assets/images/seed/perfume.png'),
		existencia: 4,
		precio: 3950,
		publicado: true
	}
)

Post.create!(
	{
		title: "Drone",
		body: "Drone espía para vigilar la compañia",
		image: File.open('app/assets/images/seed/drone.png'),
		existencia: 1,
		precio: 27925,
		publicado: true
	}
)
