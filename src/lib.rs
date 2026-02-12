use pgrx::prelude::*;

::pgrx::pg_module_magic!();

#[pg_extern]
fn hello_parodydb() -> &'static str {
    "Hello, parodydb"
}

#[pg_extern]
fn parodydb_search(document: &str, query: &str) -> bool {
    document.to_lowercase().contains(&query.to_lowercase())
}

#[cfg(any(test, feature = "pg_test"))]
#[pg_schema]
mod tests {
    use pgrx::prelude::*;

    #[pg_test]
    fn test_hello_parodydb() {
        assert_eq!("Hello, parodydb", crate::hello_parodydb());
    }

    #[pg_test]
    fn test_parodydb_search() {
        assert!(crate::parodydb_search("The quick brown fox", "quick"));
        assert!(crate::parodydb_search("The quick brown fox", "QUICK"));
        assert!(!crate::parodydb_search("The quick brown fox", "lazy"));
    }
}

#[cfg(test)]
pub mod pg_test {
    pub fn setup(_options: Vec<&str>) {
        // perform one-off initialization when the pg_test framework starts
    }

    pub fn postgresql_conf_options() -> Vec<&'static str> {
        vec![]
    }
}
