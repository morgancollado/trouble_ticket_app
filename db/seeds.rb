morgan = User.create(username: "witchymorgan", email: "witchy@morgan.com", password: "holyguacamole")
athena = Admin.create(username: "Athena", email: "athena@universe.com", password: "shewhosees")
Ticket.create(title: "I have little wisdom", content: "please grant me your wisdom", user: morgan)