library(testthat)
library(GESLib)
library(xts)
context("Animal simple tests")

animal <- new("Animal", id="X6831")
animal <- setRace(animal, readRace(id="6831", file="../../data/test_infos.csv"))
animal <- setState(animal, readState(id="6831", file="../../data/test_infos.csv"))
#animal <- setGender(animal, readGender(id="6806", file="./data_infos.csv"))

test_that("IDs, race and state are correctly saved",{
  expect_equal(animal@id, "X6831")
  expect_equal(getRace(animal), "BBM")
  expect_equal(getState(animal), "castré")
})

animal <- setMoves(animal, readMoves(id="6831", file="../../data/test_moves.csv"))

test_that("Moves is xts with realistic dates",{
  expect_s3_class(getMoves(animal), "xts")
})

animal <- setWeighing(animal, readWeighing(id="6831", file="../../data/test_weighing.csv"))

test_that("Weighing is xts with realistic dates",{
  expect_s3_class(getWeighing(animal), "xts")
})


#animal@weighing
#animal@moves

#animal <- importGreenFeedData(animal, greenfeedData)

#print(animal@data)
#print(animal@weeklydata)


