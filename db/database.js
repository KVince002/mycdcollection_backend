// this is for the postgre database
// connect for the database

const {Pool} = require("pg");
const pool = new Pool({
	host: "localhost",
	port: 5432,
	database: "mycdcollection",
	user: "postgres",
	password: "asdQWERTZ",
	allowExitOnIdle: true
})

const AllCDs = () => {
  
}

module.exports ={
	pool,
}
