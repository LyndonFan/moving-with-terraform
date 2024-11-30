from http.server import BaseHTTPRequestHandler, HTTPServer


class DomainWebServer(BaseHTTPRequestHandler):
    def do_GET(self):
        # Get the Host header (domain name)
        domain = self.headers.get("Host", "Unknown Domain")

        # Prepare response
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()

        # Send response about the domain
        response = f"You accessed this server from domain: {domain}"
        self.wfile.write(response.encode())


def run_server(port=80):
    server_address = ("", port)
    httpd = HTTPServer(server_address, DomainWebServer)
    print(f"Starting server on port {port}")
    httpd.serve_forever()


if __name__ == "__main__":
    run_server()
