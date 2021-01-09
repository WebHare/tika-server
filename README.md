# Tika server

This package wraps the Tika server and Tessaract OCR.

You should expose this server behind a proxy with middleware to take care of
any authentication, but be careful if you put this server behind a HTTP/2 proxy.
The tika server is case sensitive when processing headers such as `X-Tika-OCRLanguage`
and `X-Tika-PDFOcrStrategy` but http/2 lowercases headers.
