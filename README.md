# gurunavi

Ruby wrapper for the [gurunavi API](http://api.gnavi.co.jp/api/manual/).

## Installation

    gem install gurunavi

## Usage

### Instantiate a client

    client = Gurunavi::Client.new(keyid: 'your_keyid')

### Examples

Note: format options use json automatically.

#### get infomation of restaurants from [RestSearchAPI](http://api.gnavi.co.jp/api/manual/restsearch/)

    rests = client.rest_search

##### with options

    rests = client.rest_search(id: "ga13300")
    rests = client.rest_search(areacode_l: "AREAL2802", category_l: "RSFST05000")

See more available options from [manual](http://api.gnavi.co.jp/api/manual/restsearch/).

#### get master of area large code (areacode_l) from [GAreaLargeSearchAPI](http://api.gnavi.co.jp/api/manual/arealmaster/)

    areacode_l_master = client.g_area_large_search

## Correspondence

See [the All API lists](http://api.gnavi.co.jp/api/manual/)

#### RestSearchAPI

    rests = client.rest_search(options)

#### ForeignRestSearchAPI

    rests = client.foreign_rest_search(options)

#### PhotoSearchAPI

    photos = client.photo_search(options)

#### AreaSearchAPI

    areamaster = client.area_search

#### PrefSearchAPI

    prefmaster = client.pref_search

#### GAreaLargeSearchAPI

    areacode_l_master = client.g_area_large_search

#### GAreaMiddleSearchAPI

    areacode_m_master = client.g_area_middle_search

#### GAreaSmallSearchAPI

    areacode_s_master = client.g_area_small_search

#### CategoryLargeSearchAPI

    category_l_master = client.category_large_search

#### CategorySmallSearchAPI

    category_s_master = client.category_small_search

## Contributing to gurunavi

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2017 kobayang. See LICENSE.txt for
further details.

