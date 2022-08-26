<template>
# Heading

```ruby
class Wibble
  def greet
    puts "I, for one, welcome our glorious wibble overlords"
  end
end
```

  <p class="demo">
    {{ msg }}
  </p>
</template>

<script>
  export default {
    data() {
      return {
        msg: 'Hello this is <demo-component>'
      }
    }
  }
</script>
