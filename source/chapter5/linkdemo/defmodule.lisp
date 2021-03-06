;;;; defmodule.lisp

(restas:define-policy datastore
  (:interface-package #:linkdemo.policy.datastore)
  (:interface-method-template "DATASTORE-~A")
  (:internal-package #:linkdemo.datastore)

  (define-method init ()
    "initiate the datastore")
  
  (define-method find-user (username)
    "find the user by username")
  
  (define-method auth-user (username password)
    "Check if a user exists and has the suplied password")
  
  (define-method register-user (username password)
    "Register a new user")
  
  (define-method upvoted-p (link-id username)
    "Check if a user has upvoted a link")
  
  (define-method upvote (link-id user)
    "upvote a link")
  
  (define-method post-link (url title user)
    "post a new link")
  
  (define-method get-all-links (&optional user)
    "Get all of the links in the datastore")
  
  (define-method upvote-count (link-id)
    "get the number of upvotes for a given link"))

(restas:define-module #:linkdemo
  (:use #:cl #:restas #:linkdemo.datastore))

(defpackage #:linkdemo.pg-datastore
  (:use #:cl #:postmodern #:linkdemo.policy.datastore)
  (:export #:pg-datastore))

(in-package #:linkdemo)

(defparameter *template-directory*
  (merge-pathnames #P"templates/" linkdemo-config:*base-directory*))

(defparameter *static-directory*
  (merge-pathnames #P"static/" linkdemo-config:*base-directory*))
