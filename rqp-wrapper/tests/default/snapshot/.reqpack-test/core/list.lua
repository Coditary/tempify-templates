return {
  name = "apt list",
  request = {
    action = "list",
    system = "apt",
  },
  fakeExec = {
    {
      match = "apt list",
      exitCode = 0,
      stdout = "example-pkg 1.0.0\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "listed" },
    resultCount = 1,
    resultName = "example-pkg",
  }
}
