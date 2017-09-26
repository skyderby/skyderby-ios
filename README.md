# Skyderby-iOS

iOS app for [Skyderby](https://skyderby.ru)


## Discussion
You can [file an issue directly on GitHub](https://github.com/skyderby/skyderby-ios/issues/new) if you prefer so. But please, search first to make sure no-one has reported the same issue already before opening one yourself. Skyderby iOS does not update in your iPhone or iPad immediately when we make changes, so something you experienced might be known, or even fixed in the development version.

## How To Build

### Requirements

Swift 4, iOS deployment target: 10.0.

### Setup

First, install Bundler: `gem install bundler`.

Then, to install all dependencies, run:
* `bundle update`
* `bundle exec fastlane setup`

### Deploy

* `bundle exec fastlane release` - Production App Store/TestFlight

## Workflow

* Master branch - tagged, fully functional releases
* Develop branch - current work
* Any successful Fabric or App Store release will add tag to repo, like `fabric/1.3.0/156` or `appstore/1.3.0/156`
* On each App Store production release - merge to master, update Changelog, create GitHub release

## License

`Skyderby-iOS` source code is released under the terms of [we haven't decide] License. See the [LICENSE.md](LICENSE.md) file for more info.
