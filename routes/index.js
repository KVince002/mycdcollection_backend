var express = require('express');
var router = express.Router();
const database = require("../database")

/* GET pages about cds */
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

module.exports = router;
