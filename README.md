## Task 2: Customer question

> Hi Team, I am new to Buildkite and could use your help with best practices. How do you pass and set environment variables?

The customer's **agent `environment` hook**:

```bash
#!/bin/bash
set -euo pipefail
export USER="JohnDoe"
export PASSWORD="********"   # real value redacted here; it was shared in plain text in the ticket
```

The customer's **`pipeline.yaml`**:

```yaml
steps:
  - label: ":hammer: Tests"
    command: echo $USER $PASSWORD
    plugins:
      docker#v3.5.0:
        user: root
        image: ubuntu
```

The customer says that when they echo the values, the output is **empty**.

---

## Before and after

**Before (customer):**
```yaml
steps:
  - label: ":hammer: Tests"
    command: echo $USER $PASSWORD      
    plugins:
      docker#v3.5.0:                   
        user: root
        image: ubuntu                 
```
```yaml
env:
  APP_USERNAME: "JohnDoe"              # non-secret value set in the pipeline

steps:
  - label: ":hammer: Tests"
    command: echo "User is $$APP_USERNAME"   # filled in at runtime
    secrets:
      - APP_PASSWORD                   # password loaded from Buildkite Secrets
    plugins:
      - docker#v5.14.0:                
          image: ubuntu
          environment:                 #  pass the variables into the container
            - APP_USERNAME
            - APP_PASSWORD
```

py-lorem
========

Lorem Ipsum library for Python

Install
=======

    pip install py-lorem

Usage
=====

    import loremipsum

    #generate a random sentence of max 20 chars
    loremipsum.sentence(max_char=20)

    #generate a random sentence of arbitrary length
    loremipsum.sentence()

    #generate a random paragraph of max 100 chars
    loremipsum.paragraph(max_char=100)

    #generate a random paragraph of arbitrary length
    loremipsum.paragraph

License
=======

The license for this is to of do-whatever-the-hell-you-want-with-it :)

Author
======

nubela (nubela@gmail.com)
