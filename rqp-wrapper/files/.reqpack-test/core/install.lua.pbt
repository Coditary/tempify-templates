return {
  name = "{{ system_name }} install",
  request = {
    action = "install",
    system = "{{ system_name }}",
    packages = {
      { name = "example-pkg", version = "1.0.0" }
    },
  },
  fakeExec = {
    {
      match = "{{ system_name }} install example-pkg==1.0.0",
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
