return {
  name = "{{ system_name }} search",
  request = {
    action = "search",
    system = "{{ system_name }}",
    prompt = "example",
  },
  fakeExec = {
    {
      match = "{{ system_name }} search example",
      exitCode = 0,
      stdout = "example-pkg 1.0.0 Example package\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "searched" },
    resultCount = 1,
    resultName = "example-pkg",
  }
}
