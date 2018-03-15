# find-circle-yml

A command-line tool for finding which repositories in your GitHub organization or Bitbucket team have `circle.yml` configuration files.

## Installation

    $ gem install find-circle-yml

## Usage

**GitHub**

    $ GITHUB_ORGANIZATION=<your github org> GITHUB_USER=<your github user> GITHUB_ACCESS_TOKEN=<your personal access token> find-circle-yml
    https://github.com/your-org/your-repo/blob/master/circle.yml
    https://github.com/your-org/another-repo/blob/master/circle.yml

**Bitbucket**

    $ BITBUCKET_TEAM=<your bitbucket team> BITBUCKET_USER=<your bitbucket user> BITBUCKET_APP_PASSWORD=<your bitbucket password> find-circle-yml
    https://bitbucket.org/your-team/your-repo/src/bb030e9dcee6218d0ce521b7312e60e5cc5db4a3/circle.yml
    https://bitbucket.org/your-team/another-repo/src/cf9f1078be258dd902ff49718e5ee5422e2dd08f/circle.yml

Writes a list of repositories that contain a `circle.yml` to standard out.

## Authorization

Authorization requires creating an app-specific password for your platform:

**GitHub**

See [the docs for creating a personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/). Ensure that the token has the **repo** and **read:org** scope.  Use the token as the value of `GITHUB_ACCESS_TOKEN` environment variable.

**Bitbucket**

See [the docs for creating an app password](https://confluence.atlassian.com/bitbucket/app-passwords-828781300.html). Ensure that the app password has the **Team membership Read** and **Repositories Read** permissions. Use the app password as the value of `BITBUCKET_APP_PASSWORD` environment variable.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/circleci/find-circle-yml. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the find-circle-yml project is expected to follow the [code of conduct](https://github.com/CircleCI-Public/find-circle-yml/blob/master/CODE_OF_CONDUCT.md).
