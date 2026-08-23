return {
  name = "{{ system_name }} info",
  request = {
    action = "info",
    system = "{{ system_name }}",
    prompt = "example-pkg",
  },
  fakeExec = {
    {
      match = "{{ system_name }} info example-pkg",
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
