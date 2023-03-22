#![deny(warnings)]
use warp::{Filter};

// use warp::{sse::Event, Filter};

// use futures_util::StreamExt;

// use std::convert::Infallible;
// use std::time::Duration;

// use tokio::time::interval;

// use tokio_stream::wrappers::IntervalStream;

// fn print_my_name_wrapper() -> Result<Event, Infallible> {
//     print_my_name();
//     Ok(warp::sse::Event::default().data("Slim Shady!"))
// }

fn print_my_name() {
    println!("Slim Shady!");
}

#[tokio::main]
async fn main() {
    // Match any request and return hello world!
    // let routes = warp::any().map(|| "Hello, World!");
    // let routes = warp::path::end().and(warp::get()).map(|| {
    //     // create server event source
    //     let interval = interval(Duration::from_secs(1));
    //     let stream = IntervalStream::new(interval);
    //     let event_stream = stream.map(move |_| {
    //         println!("Hello");
    //         print_my_name_wrapper()s
    //     });
    //     // reply using server-sent events
    //     warp::sse::reply(event_stream)
    // });



    // GET / -> index html
    let index = warp::path::end().map(|| {
        warp::http::Response::builder()
            .header("content-type", "text/html; charset=utf-8")
            .body(INDEX_HTML)
    });

    // let post = warp::path("name").and(warp::post()).map(|| {
    //     // create server event source
    //     print_my_name();
    //     // reply using server-sent events
    //     warp::reply()
    // });

    let post = warp::path!("name").map(|| {
      print_my_name();
      // format!("Test")
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
