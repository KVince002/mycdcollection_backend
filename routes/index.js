var express = require('express');
var router = express.Router();
const database = require("../db/database")
const {AllCDs, AllCDs_DBQuery, SpecificCds_DBQuery, OverallDetails, Specific_cd_details_DBQuery} = require("../db/database");
const e = require("express");
const {response, request, json} = require("express");


// Every cd and tracks details
/*
	This is for double check how many tracks and cd I have in the database. This will be good for catching errors
 */
async function Details (){
	let result = await OverallDetails();
	console.info("Details updated");
	console.log(result.rows)
	return result.rows;
}
// This will run for the first time to get thing works
let details = Details();
// This will update the details (should update in every 1 min and a bit more)
details = setInterval(Details, 61000000);

/* GET pages about cds */
// GET - all the cds from the database
router.get('/fetchallcds', async (req, res, next) => {
	console.log("found fetchallcds url");
	// database query
	try {
		const query_result = await AllCDs_DBQuery();
		res.setHeader('Content-Type', 'application/json')
		res.status(200).json(query_result.rows)
	} catch (err) {
		console.error(err)
		res.setHeader('Content-Type', 'application/json')
		res.status(500).json({msg: err})
	}
});

// GET - specific cd with all details
// Todo: Handle if the ID does not exist
router.get("/cds/:cdItem", async (req, res) => {
	console.info(req.params);
	console.log(`/cds/:cdItem param is ${req.params.cdItem}`);
	const paramInt = parseInt(req.params.cdItem);
// query for CD details
	try {
		let CDDetails = await SpecificCds_DBQuery(paramInt);
		console.log(CDDetails.rows)
		res.status(200).json(CDDetails)
	}
	catch (e) {
		console.error(e)
		res.status(500).json({msg: e})
	}
})

// todo get specific cd
// get specific cd
router.get("/cds/spec/cd/:cdId", async (request, response,  next) => {
	console.info("cds/spec/cd/:cdId found with "+ request.params.cdId + "id")
	const idParameter = request.params.cdId
	try {
		if (idParameter >= parseInt(details.cd_count) || idParameter<=0){
			response.status(404).json({error: "Not found"})
		}
		const result = await Specific_cd_details_DBQuery(request.params.cdId)
		response.status(200).json(result.rows)
	}catch (e) {
		response.status(500).json({mgs: e})
	}
})

// todo get specific songs
// get specific songs by album
router.get("cds/spec/tracks/:cdId", async (request, response, next) => {
	console.info("cds/spec/tracks/:cdId found with "+ request.params.cdId + " id")
	const idParameter = parseInt(request.params.cdId)
	try {
		if (idParameter >= parseInt(details.cd_count) || idParameter<=0){
			console.error(`Paramatered id outbound`)
			response.status(404).json({error: "Not found"})
		}
		const result = await pool.query("SELECT * FROM tracks WHERE tracks.album = $1::integer", [idParameter])
		response.status(200).json(result.rows)
	}catch (e) {
		response.status(404).json({msg:e})
	}
})

// todo post new cd
router.post("cds/newcd", async (request,response,next) =>{

})

// todo patch already cd

// todo delete cd

// todo profile handling (for me only)

module.exports = router;