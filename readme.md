# Search Engine

This search engine loads data from json files and provides a console interface that allows the user to search for data.  Values from any related entities are included in the search results.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

```
run 'gem install rspec'
run 'gem install json'
```

### Installing

```
git clone https://github.com/stevenclouston/demo_search_engine.git
```

Navigate to the installation folder in Terminal.

Enter the line ```ruby user_interface.rb``` in terminal. This will start the console application

To test that the application is running correctly, enter ```101``` as the search value.

The result should be:

```
Data Type: Project
_id: 101
created_at: 2016-05-21T11:10:28 -10:00
data_set_name: project
external_id: 9270ed79-35eb-4a38-a46f-35725197ea8d
name: My first project
published: false
tags: ["Exterior", "Workplace Fun"]
url: http://example.com/projects-1
```


## Running the tests

Ensure that rspec is installed: run 'gem install rspec'
Run: 'rspec spec' in Terminal
11 examples should be completed successfully

### Break down into end to end tests

Tests are separated into 3 files: search_engine_spec tests, data_handler_spec tests, and user_interface_spec tests.

search_engine_spec tests ensure that data can be loaded into the SearchEngine class and found correctly.

data_handler_spec tests ensure that the DataHandler class creates a SearchEngine and loads data from different locations.

user_interface_test ensures that the user interface object is created correctly.

### Coding style tests

Use rubocop for testing syntax.

```
rubocop data_handler.rb  
```

## Authors

* **Steven Clouston**
