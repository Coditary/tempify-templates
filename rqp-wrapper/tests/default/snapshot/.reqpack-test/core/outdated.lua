return {
  name = "apt outdated",
  request = {
    action = "outdated",
    system = "apt",
  },
  fakeExec = {
    {
      match = "apt outdated",
      exitCode = 0,
      stdout = "example-pkg 1.0.0 2.0.0\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "outdated" },
    resultCount = 1,
    resultName = "example-pkg",
  }
}
