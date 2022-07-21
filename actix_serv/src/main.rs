use actix_web::{get, App, HttpServer, Responder};
use rand;

fn matrix(m1: Vec<Vec<u64>>, m2: Vec<Vec<u64>>) -> u64 {
    let mut m3: Vec<Vec<u64>> = m1.clone();
    for n in 0..m1.len() {
        for i in 0..m1[n].len() {
            m3[n][i] = m1[n][i]*m2[n][i];
        }
    }
    m3[0][0] = rand::random();
    m3[0][0]
}

#[get("/")]
async fn greet() -> impl Responder {
    let mut m1: Vec<Vec<u64>> = Default::default();
    let mut m2: Vec<Vec<u64>> = Default::default();
    for n in 0..1000000 {
        for _i in 0..1000000 {
            let temp1: u64 = rand::random();
            let temp2: u64 = rand::random();
            m1[n].push(temp1);
            m2[n].push(temp2);
        }
    }
    format!("Hello {}!", matrix(m1, m2))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(greet)
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
