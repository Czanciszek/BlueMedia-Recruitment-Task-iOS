# Autopay Take-Home Task

## About Task

I started this project with a name including BlueMedia because of service that is used inside to fetch data results.

I must say, I took to heart that it was written that app architecture will be also taken into consideration. Despite of simplicity of task, I've decided then to go with MVVM + Coordinators and do it in the best way trying to use SOLID principles to have it quite simple to extend even if that's just a quick task that won't be rather continued.

In the middle of doing this task I've got afraid that I'm doing some overkill here as it went over 4 hours trying to make it that way. But because I was already in the middle, I decided to finish it that way.

## Libraries

From additional frameworks I've decided first to use RxSwift as I feel more strong with that library, however I read that you're trying to use Combine with SwiftUI so I've decided to migrate it at least to a Combine side.

You can see the difference on the another branch: `tech/migrate-to-combine`. There should be also a PR with changes.
