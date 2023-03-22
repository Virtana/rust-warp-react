use warp::Filter;

fn print_my_name() {
    println!("Slim Shady!");
}

#[tokio::main]
async fn main() {
    let index = warp::path::end().map(|| {
        warp::http::Response::builder()
            .header("content-type", "text/html; charset=utf-8")
            .body(INDEX_HTML)
    });

    let post = warp::path!("name").map(|| {
        print_my_name();
        warp::reply::json(&"Slim Shady!")
    });

    let routes = index.or(post);

    warp::serve(routes).run(([127, 0, 0, 1], 3030)).await;
}

static INDEX_HTML: &str = r#"
<!DOCTYPE html>
<html>
    <head>
        <title>Warp</title>
    </head>
    <body>
        <h1>warp</h1>
    </body>
</html>
"#;
