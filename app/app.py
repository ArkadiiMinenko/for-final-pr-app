from http.server import BaseHTTPRequestHandler, HTTPServer
import socket

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            pod_ip = socket.gethostbyname(socket.gethostname())
            self.send_response(200)
            self.send_header("Content-Type", "text/plain; charset=utf-8")
            self.end_headers()
            self.wfile.write(f"OK\nPod IP: {pod_ip}\n".encode())
            self.write(f"TEEEEEEESTTTTT")
        else:
            self.send_error(404)

if __name__ == "__main__":
    PORT = 8000
    server = HTTPServer(("", PORT), SimpleHandler)
    print(f"Listening on 0.0.0.0:{PORT}")
    server.serve_forever()

#it's test coment
#
#