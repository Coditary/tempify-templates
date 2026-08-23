return {
  name = "apt info",
  request = {
    action = "info",
    system = "apt",
    prompt = "example-pkg",
  },
  fakeExec = {
    {
      match = "apt info example-pkg",
      exitCode = 0,
      stdout = "name: example-pkg\nversion: 1.0.0\ndescription: Example package\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "informed" },
    resultCount = 1,
    resultName = "example-pkg",
    resultVersion = "1.0.0",
  }
}
