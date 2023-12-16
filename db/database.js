// this is for the postgres database

// connect for the database
const {Pool} = require("pg");
const {client_encoding} = require("pg/lib/defaults");
const {errors} = require("pg-promise");
const constants = require("constants");

const pool = new Pool({
	host: "localhost",
	port: 5432,
	database: "mycdcollection",
	user: "postgres",
	password: "asdqwertz",
	allowExitOnIdle: true
})

// often used database requests
// all cds
async function AllCDs_DBQuery (){
	// "inline variable"
	return await pool.query("SELECT * FROM cd")
}

// one specific cd and details
async function SpecificCds_DBQuery(cdId){
	// Todo: an epic query here to search a specific cd
	let result = null;
	try {
		result = pool.query("SELECT cd.cover AS CDCover, cd.title AS CDTitle, cd.sleeve AS CDSleeve, cd.review AS CDReview, cd.genre AS CDGenre, cd.artist AS CDArtist, tracks.title AS TrackTitle FROM cd INNER JOIN tracks ON cd.id = tracks.album WHERE tracks.album = $1::integer", [cdId]);
		return result;
	}catch (e) {
		result = e;
	}
	console.log(result);

	return result;

}

module.exports ={
	AllCDs_DBQuery, SpecificCds_DBQuery
}
