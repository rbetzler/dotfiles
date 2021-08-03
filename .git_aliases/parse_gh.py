"""Parse github cli pr list and color print to terminal"""
import ast
import os
import sys


class Parse:
    def __init__(self, prs: str):
        """prs is the raw github cli pr list as a str, which we convert to a dict"""
        self.me = 'rbetzler'
        self.team = os.environ.get('WORK_TEAM_PR').split(',')
        # Wrap bools in quotes
        for x, y in [
            (':true,', ':"true",'),
            (':false,', ':"false",'),
        ]:
            prs = prs.replace(x, y)
        self.prs = ast.literal_eval(prs)

    @property
    def base_str(self) -> str:
        """Formatted, colored string that prints to cli"""
        return '\033[95m{author}\n\033[96m#{number} {status}\n  \033[92m{title}\n  \033[4m\033[94m{url}\033[0m'

    def execute(self, req: str):
        """req is the request type: all, me, team"""
        final_str = ''
        for pr in self.prs:
            author = pr['author']['login']
            if (req == 'all'
                or (req == 'me' and author == self.me)
                or (req == 'team' and author in self.team)
            ):
                status = 'DRAFT' if pr['isDraft']=='true' else 'OPEN'
                final_str += self.base_str.format(
                        author=author,
                        number=pr['number'],
                        status=status,
                        title=pr['title'],
                        url=pr['url'],
                )
                final_str += '\n\n'
        print(final_str)


if __name__ == '__main__':
    Parse(prs=sys.argv[2]).execute(req=sys.argv[1])
