var express = require('express');
var router = express.Router();
const database = require("../db/database")
const {AllCDs, AllCDs_DBQuery, SpecificCds_DBQuery} = require("../db/database");
const e = require("express");
const {errors} = require("pg-promise");

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

// GET - specific cd
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

module.exports = router;
