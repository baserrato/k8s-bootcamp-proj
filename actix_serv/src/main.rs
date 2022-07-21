use actix_web::{get, web, App, HttpServer, Responder};

#[get("/{num}")]
async fn greet(num: web::Path<String>) -> impl Responder {
    format!("Hello {num}!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(greet)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
