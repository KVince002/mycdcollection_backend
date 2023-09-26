var express = require('express');
var router = express.Router();
const database = require("../db/database")
const {queryCD, pool} = require("../db/database");
const e = require("express");

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
  }
  catch (err){
    console.error(err)
    res.status(500).json({msg: "casual error happened"})
  }
  });

// GET - specific cd
// Todo: Handle if the ID does not exist
router.get("/cds/:cdItem", (req, res) => {
console.log(`/cds/:cdItem param is ${req.params.cdItem}`);
const paramInt = parseInt( req.params.cdItem);
pool.query("SELECT * FROM cd WHERE id = $1", [paramInt], (error, result) => {
  if (error){
    res.json({msg: error})
  }
  res.status(200).json(result.rows)
  });

})

module.exports = router;
