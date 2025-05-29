#include <iostream>
#include <vector>
#include <algorithm>
#include <chrono>
#include "func.h"
#include "httplib.h"

int main() {
    httplib::Server svr;

    svr.Get("/calc", [](const httplib::Request& req, httplib::Response& res) {
        TrigFunc tf;

        auto start = std::chrono::high_resolution_clock::now();

        std::vector<double> results;
        for (int i = 0; i < 1000; ++i) {
            results.push_back(tf.FuncA(0.5, 5)); // x=0.5, n=5
        }

        std::sort(results.begin(), results.end());

        auto end = std::chrono::high_resolution_clock::now();
        double time = std::chrono::duration<double>(end - start).count();

        std::string json = "{ \"time\": " + std::to_string(time) +
                           ", \"first\": " + std::to_string(results.front()) +
                           ", \"last\": " + std::to_string(results.back()) + " }";

        res.set_content(json, "application/json");
    });

    std::cout << "Server running on http://localhost:8080/calc\n";
    svr.listen("0.0.0.0", 8080);
}
