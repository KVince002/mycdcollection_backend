var express = require('express');
var router = express.Router();
const database = require("../db/database")
const {queryCD, pool} = require("../db/database");
const e = require("express");
const {errors} = require("pg-promise");

/* GET pages about cds */
// GET - all the cds from the database
router.get('/fetchallcds', async (req, res, next) => {
	console.log("found fetchallcds url");
	// database query
	try {
		const result =
			await database.query("SELECT * FROM cd");
		res.setHeader('Content-Type', 'application/json')
		res.status(200).json(result.rows)
	} catch (err) {
		console.error(err)
		res.status(500).json({msg: "casual error happened"})
	}
});

// GET - specific cd
// Todo: Handle if the ID does not exist
router.get("/cds/:cdItem", (req, res) => {
	console.log(`/cds/:cdItem param is ${req.params.cdItem}`);
	const paramInt = parseInt(req.params.cdItem);
// query for CD details
	let CDDetails = null
	pool.query("SELECT cd.cover AS CDCover, cd.title AS CDTitle, cd.sleeve AS CDSleeve, cd.review AS CDReview," +
		" cd.genre AS CDGenre, cd.artist AS CDArtist, tracks.title AS TrackTitle FROM cd INNER JOIN tracks ON cd.id" +
		" = tracks.album WHERE tracks.album = $1", [paramInt], (error, result) => {
		if (error) {
			res.json({msg: error})
		}
		CDDetails = result.rows
	});
	console.log(CDDetails)
	res.status(200).json(CDDetails)
})

module.exports = router;
