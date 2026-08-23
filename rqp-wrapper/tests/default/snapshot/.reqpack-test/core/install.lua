return {
  name = "apt install",
  request = {
    action = "install",
    system = "apt",
    packages = {
      { name = "example-pkg", version = "1.0.0" }
    },
  },
  fakeExec = {
    {
      match = "apt install example-pkg==1.0.0",
      exitCode = 0,
      stdout = "installed\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "installed", "success" },
    eventPayloads = {
      success = "ok",
    },
  }
}
