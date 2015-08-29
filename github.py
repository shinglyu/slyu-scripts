#!/usr/bin/env python
import readline
import os
import requests
import requests_cache

username = "shinglyu"

requests_cache.install_cache(expire_after=24*60*60)

def init():
    #keep the sorted order
    import ctypes
    rl = ctypes.cdll.LoadLibrary('libreadline.so')
    sort = ctypes.c_ulong.in_dll(rl, 'rl_sort_completion_matches')
    sort.value = 0


def get_repos(username):
    params = {
        'type':'all',
        'per_page':'100',
        'sort':'updated',
        'direction':'desc'
    }
    # Get personal repo
    url = "https://api.github.com/users/{0}/repos".format(username)
    r = requests.get(url, params=params)
    #print(r.url)
    #repos = sorted(r.json(), key=lambda x: x['updated_at'])
    repos = r.json()

    # Get org repo
    url = "https://api.github.com/users/{0}/orgs".format(username)
    org = requests.get(url, params=params)
    for repo_url in map(lambda x: x['repos_url'], org.json()):
        r = requests.get(repo_url, params=params)
        #print(r.url)
        #repos = sorted(r.json(), key=lambda x: x['updated_at'])
        repos.extend(r.json())


    #print (map(lambda x: x['name'], repos))
    repos = sorted(repos, key=lambda x: x['updated_at'], reverse=True)
    repo_names = map(lambda x: x['name'], repos)
    repo_links = dict((x['name'], x['html_url']) for x in repos)
    return (repo_names, repo_links)

class GithubRepoCompleter(object):
    def __init__(self, repo_names):
        self.options = repo_names

    def complete(self, text, state):
    #options = [i for i in commands if i.startswith(text)]
        matches = [i for i in self.options if (text in i)]
        #matches = [i for i in self.options if i.startswith(text)]
        if state < len(matches):
            return matches[state]
        else:
            return None

#init()
repo_names, repo_links = get_repos(username)

readline.parse_and_bind("tab: complete")
readline.set_completer(GithubRepoCompleter(repo_names).complete)

print "Your most recent repos:"
for idx, repo in enumerate(repo_names[0:9]):
    print "\t{0}) {1}".format(idx, repo)
repo_name_query = raw_input("Search:")

try:
    if repo_name_query in map(str, range(0,9)):
        link = repo_links[repo_names[int(repo_name_query)]]
    else:
        link = repo_links[repo_name_query]
except KeyError:
    link = "https://github.com/search?q=user:{0}+{1}".format(username, repo_name_query)


print "Opening " + repo_name_query + " at " + link
os.system('firefox ' + link)
