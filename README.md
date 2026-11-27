# homebrew-tap

My own homebrew taps.

There's likely only one formula you care about: [`mdlint`](https://github.com/swanysimon/mdlint). The others are highly
experimental and for my own use, not necessarily yours.

```shell
brew tap swanysimon/tap
brew install mdlint

# OR

brew install swanysimon/tap/<formula>
```

You could also use a `Brewfile`:

```ruby
tap "swanysimon/tap"
brew "mdlint"

# OR

brew "swanysimon/tap/mdlint"
```
