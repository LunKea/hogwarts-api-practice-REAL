import * as housesRepository from "../repositories/houses.repository.js";

// get all houses
export const getAllHouses = async (req, res) => {
  try {
    const allHouses = await housesRepository.getAllHouses();

    console.table(allHouses);
    res.json(allHouses);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error", code: err.code });
  }
};

export const getSingleHouses = async (req, res) => {
  try {
    const singleHouse = await housesRepository.getSingleHouse(req.params.id);
    if (singleHouse.rowCount === 0) return res.sendStatus(404);
    res.status(200).json(singleHouse.rows[0]);
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};
